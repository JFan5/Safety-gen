(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v6)
		(pred_5 ?v8)
		(pred_3 ?v3)
		(pred_4 ?v3)
		(pred_2 ?v8 ?v3)
		(pred_1)
		(pred_6 ?v8))

   (:action op_1
       :parameters  (?v5 ?v2)
       :precondition (and (not-eq ?v5 ?v2) 
                          (pred_3 ?v5) (pred_3 ?v2) (pred_4 ?v5))
       :effect (and  (pred_4 ?v2)
		     (not (pred_4 ?v5))))


   (:action op_2
       :parameters (?v7 ?v1)
       :precondition  (and  (pred_5 ?v7) (pred_3 ?v1)
			    (pred_2 ?v7 ?v1) (pred_4 ?v1) (pred_1))
       :effect (and (pred_6 ?v7)
		    (not (pred_2 ?v7 ?v1)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v7  ?v1)
       :precondition  (and  (pred_5 ?v7) (pred_3 ?v1)
			    (pred_6 ?v7) (pred_4 ?v1))
       :effect (and (pred_2 ?v7 ?v1)
		    (pred_1)
		    (not (pred_6 ?v7)))))
