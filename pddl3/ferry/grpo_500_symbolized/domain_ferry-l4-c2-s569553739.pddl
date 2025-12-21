(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v7)
		(pred_5 ?v2)
		(pred_2 ?v4)
		(pred_4 ?v4)
		(pred_3 ?v2 ?v4)
		(pred_1)
		(pred_6 ?v2))

   (:action op_3
       :parameters  (?v6 ?v8)
       :precondition (and (not-eq ?v6 ?v8) 
                          (pred_2 ?v6) (pred_2 ?v8) (pred_4 ?v6))
       :effect (and  (pred_4 ?v8)
		     (not (pred_4 ?v6))))


   (:action op_1
       :parameters (?v1 ?v3)
       :precondition  (and  (pred_5 ?v1) (pred_2 ?v3)
			    (pred_3 ?v1 ?v3) (pred_4 ?v3) (pred_1))
       :effect (and (pred_6 ?v1)
		    (not (pred_3 ?v1 ?v3)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v1  ?v3)
       :precondition  (and  (pred_5 ?v1) (pred_2 ?v3)
			    (pred_6 ?v1) (pred_4 ?v3))
       :effect (and (pred_3 ?v1 ?v3)
		    (pred_1)
		    (not (pred_6 ?v1)))))
