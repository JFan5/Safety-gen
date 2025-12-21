(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v6)
		(pred_2 ?v4)
		(pred_4 ?v5)
		(pred_5 ?v5)
		(pred_1 ?v4 ?v5)
		(pred_3)
		(pred_6 ?v4))

   (:action op_1
       :parameters  (?v1 ?v8)
       :precondition (and (not-eq ?v1 ?v8) 
                          (pred_4 ?v1) (pred_4 ?v8) (pred_5 ?v1))
       :effect (and  (pred_5 ?v8)
		     (not (pred_5 ?v1))))


   (:action op_2
       :parameters (?v2 ?v3)
       :precondition  (and  (pred_2 ?v2) (pred_4 ?v3)
			    (pred_1 ?v2 ?v3) (pred_5 ?v3) (pred_3))
       :effect (and (pred_6 ?v2)
		    (not (pred_1 ?v2 ?v3)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v2  ?v3)
       :precondition  (and  (pred_2 ?v2) (pred_4 ?v3)
			    (pred_6 ?v2) (pred_5 ?v3))
       :effect (and (pred_1 ?v2 ?v3)
		    (pred_3)
		    (not (pred_6 ?v2)))))
