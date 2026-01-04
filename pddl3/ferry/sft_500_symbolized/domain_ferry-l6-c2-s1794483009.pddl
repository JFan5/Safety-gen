(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v2)
		(pred_2 ?v5)
		(pred_1 ?v7)
		(pred_3 ?v7)
		(pred_5 ?v5 ?v7)
		(pred_4)
		(pred_6 ?v5))

   (:action op_2
       :parameters  (?v1 ?v8)
       :precondition (and (not-eq ?v1 ?v8) 
                          (pred_1 ?v1) (pred_1 ?v8) (pred_3 ?v1))
       :effect (and  (pred_3 ?v8)
		     (not (pred_3 ?v1))))


   (:action op_1
       :parameters (?v4 ?v3)
       :precondition  (and  (pred_2 ?v4) (pred_1 ?v3)
			    (pred_5 ?v4 ?v3) (pred_3 ?v3) (pred_4))
       :effect (and (pred_6 ?v4)
		    (not (pred_5 ?v4 ?v3)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v4  ?v3)
       :precondition  (and  (pred_2 ?v4) (pred_1 ?v3)
			    (pred_6 ?v4) (pred_3 ?v3))
       :effect (and (pred_5 ?v4 ?v3)
		    (pred_4)
		    (not (pred_6 ?v4)))))
