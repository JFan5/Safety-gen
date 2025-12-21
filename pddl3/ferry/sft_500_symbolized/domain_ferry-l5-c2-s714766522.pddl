(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v7)
		(pred_2 ?v6)
		(pred_1 ?v1)
		(pred_6 ?v1)
		(pred_3 ?v6 ?v1)
		(pred_5)
		(pred_4 ?v6))

   (:action op_3
       :parameters  (?v8 ?v2)
       :precondition (and (not-eq ?v8 ?v2) 
                          (pred_1 ?v8) (pred_1 ?v2) (pred_6 ?v8))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v8))))


   (:action op_1
       :parameters (?v4 ?v5)
       :precondition  (and  (pred_2 ?v4) (pred_1 ?v5)
			    (pred_3 ?v4 ?v5) (pred_6 ?v5) (pred_5))
       :effect (and (pred_4 ?v4)
		    (not (pred_3 ?v4 ?v5)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v4  ?v5)
       :precondition  (and  (pred_2 ?v4) (pred_1 ?v5)
			    (pred_4 ?v4) (pred_6 ?v5))
       :effect (and (pred_3 ?v4 ?v5)
		    (pred_5)
		    (not (pred_4 ?v4)))))
