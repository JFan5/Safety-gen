(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v3)
		(pred_4 ?v1)
		(pred_3 ?v7)
		(pred_1 ?v7)
		(pred_2 ?v1 ?v7)
		(pred_5)
		(pred_6 ?v1))

   (:action op_1
       :parameters  (?v8 ?v2)
       :precondition (and (not-eq ?v8 ?v2) 
                          (pred_3 ?v8) (pred_3 ?v2) (pred_1 ?v8))
       :effect (and  (pred_1 ?v2)
		     (not (pred_1 ?v8))))


   (:action op_2
       :parameters (?v4 ?v5)
       :precondition  (and  (pred_4 ?v4) (pred_3 ?v5)
			    (pred_2 ?v4 ?v5) (pred_1 ?v5) (pred_5))
       :effect (and (pred_6 ?v4)
		    (not (pred_2 ?v4 ?v5)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v4  ?v5)
       :precondition  (and  (pred_4 ?v4) (pred_3 ?v5)
			    (pred_6 ?v4) (pred_1 ?v5))
       :effect (and (pred_2 ?v4 ?v5)
		    (pred_5)
		    (not (pred_6 ?v4)))))
