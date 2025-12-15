(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v7)
		(pred_6 ?v1)
		(pred_3 ?v6)
		(pred_2 ?v6)
		(pred_4 ?v1 ?v6)
		(pred_5)
		(pred_1 ?v1))

   (:action op_3
       :parameters  (?v8 ?v5)
       :precondition (and (not-eq ?v8 ?v5) 
                          (pred_3 ?v8) (pred_3 ?v5) (pred_2 ?v8))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v8))))


   (:action op_1
       :parameters (?v3 ?v4)
       :precondition  (and  (pred_6 ?v3) (pred_3 ?v4)
			    (pred_4 ?v3 ?v4) (pred_2 ?v4) (pred_5))
       :effect (and (pred_1 ?v3)
		    (not (pred_4 ?v3 ?v4)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v3  ?v4)
       :precondition  (and  (pred_6 ?v3) (pred_3 ?v4)
			    (pred_1 ?v3) (pred_2 ?v4))
       :effect (and (pred_4 ?v3 ?v4)
		    (pred_5)
		    (not (pred_1 ?v3)))))
