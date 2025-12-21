(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v8)
		(pred_4 ?v5)
		(pred_6 ?v2)
		(pred_1 ?v2)
		(pred_2 ?v5 ?v2)
		(pred_5)
		(pred_3 ?v5))

   (:action op_1
       :parameters  (?v1 ?v6)
       :precondition (and (not-eq ?v1 ?v6) 
                          (pred_6 ?v1) (pred_6 ?v6) (pred_1 ?v1))
       :effect (and  (pred_1 ?v6)
		     (not (pred_1 ?v1))))


   (:action op_2
       :parameters (?v4 ?v3)
       :precondition  (and  (pred_4 ?v4) (pred_6 ?v3)
			    (pred_2 ?v4 ?v3) (pred_1 ?v3) (pred_5))
       :effect (and (pred_3 ?v4)
		    (not (pred_2 ?v4 ?v3)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v4  ?v3)
       :precondition  (and  (pred_4 ?v4) (pred_6 ?v3)
			    (pred_3 ?v4) (pred_1 ?v3))
       :effect (and (pred_2 ?v4 ?v3)
		    (pred_5)
		    (not (pred_3 ?v4)))))
