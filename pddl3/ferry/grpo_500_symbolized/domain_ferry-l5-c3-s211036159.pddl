(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v5)
		(pred_4 ?v2)
		(pred_6 ?v4)
		(pred_5 ?v4)
		(pred_2 ?v2 ?v4)
		(pred_1)
		(pred_3 ?v2))

   (:action op_3
       :parameters  (?v7 ?v8)
       :precondition (and (not-eq ?v7 ?v8) 
                          (pred_6 ?v7) (pred_6 ?v8) (pred_5 ?v7))
       :effect (and  (pred_5 ?v8)
		     (not (pred_5 ?v7))))


   (:action op_1
       :parameters (?v1 ?v3)
       :precondition  (and  (pred_4 ?v1) (pred_6 ?v3)
			    (pred_2 ?v1 ?v3) (pred_5 ?v3) (pred_1))
       :effect (and (pred_3 ?v1)
		    (not (pred_2 ?v1 ?v3)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v1  ?v3)
       :precondition  (and  (pred_4 ?v1) (pred_6 ?v3)
			    (pred_3 ?v1) (pred_5 ?v3))
       :effect (and (pred_2 ?v1 ?v3)
		    (pred_1)
		    (not (pred_3 ?v1)))))
