(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v2)
		(pred_2 ?v6)
		(pred_5 ?v1)
		(pred_1 ?v1)
		(pred_4 ?v6 ?v1)
		(pred_6)
		(pred_3 ?v6))

   (:action op_1
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_5 ?v4) (pred_5 ?v3) (pred_1 ?v4))
       :effect (and  (pred_1 ?v3)
		     (not (pred_1 ?v4))))


   (:action op_2
       :parameters (?v7 ?v8)
       :precondition  (and  (pred_2 ?v7) (pred_5 ?v8)
			    (pred_4 ?v7 ?v8) (pred_1 ?v8) (pred_6))
       :effect (and (pred_3 ?v7)
		    (not (pred_4 ?v7 ?v8)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v7  ?v8)
       :precondition  (and  (pred_2 ?v7) (pred_5 ?v8)
			    (pred_3 ?v7) (pred_1 ?v8))
       :effect (and (pred_4 ?v7 ?v8)
		    (pred_6)
		    (not (pred_3 ?v7)))))
