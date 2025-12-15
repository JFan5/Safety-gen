(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v2)
		(pred_2 ?v8)
		(pred_3 ?v3)
		(pred_5 ?v3)
		(pred_1 ?v8 ?v3)
		(pred_4)
		(pred_6 ?v8))

   (:action op_1
       :parameters  (?v5 ?v6)
       :precondition (and (not-eq ?v5 ?v6) 
                          (pred_3 ?v5) (pred_3 ?v6) (pred_5 ?v5))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v5))))


   (:action op_3
       :parameters (?v7 ?v1)
       :precondition  (and  (pred_2 ?v7) (pred_3 ?v1)
			    (pred_1 ?v7 ?v1) (pred_5 ?v1) (pred_4))
       :effect (and (pred_6 ?v7)
		    (not (pred_1 ?v7 ?v1)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v7  ?v1)
       :precondition  (and  (pred_2 ?v7) (pred_3 ?v1)
			    (pred_6 ?v7) (pred_5 ?v1))
       :effect (and (pred_1 ?v7 ?v1)
		    (pred_4)
		    (not (pred_6 ?v7)))))
