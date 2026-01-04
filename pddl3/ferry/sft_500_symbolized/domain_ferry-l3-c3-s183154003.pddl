(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v5)
		(pred_6 ?v8)
		(pred_4 ?v2)
		(pred_1 ?v2)
		(pred_2 ?v8 ?v2)
		(pred_5)
		(pred_3 ?v8))

   (:action op_3
       :parameters  (?v1 ?v4)
       :precondition (and (not-eq ?v1 ?v4) 
                          (pred_4 ?v1) (pred_4 ?v4) (pred_1 ?v1))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v1))))


   (:action op_1
       :parameters (?v7 ?v3)
       :precondition  (and  (pred_6 ?v7) (pred_4 ?v3)
			    (pred_2 ?v7 ?v3) (pred_1 ?v3) (pred_5))
       :effect (and (pred_3 ?v7)
		    (not (pred_2 ?v7 ?v3)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v7  ?v3)
       :precondition  (and  (pred_6 ?v7) (pred_4 ?v3)
			    (pred_3 ?v7) (pred_1 ?v3))
       :effect (and (pred_2 ?v7 ?v3)
		    (pred_5)
		    (not (pred_3 ?v7)))))
