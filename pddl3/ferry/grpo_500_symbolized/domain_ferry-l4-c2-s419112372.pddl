(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v3)
		(pred_5 ?v2)
		(pred_2 ?v6)
		(pred_4 ?v6)
		(pred_1 ?v2 ?v6)
		(pred_6)
		(pred_3 ?v2))

   (:action op_2
       :parameters  (?v4 ?v7)
       :precondition (and (not-eq ?v4 ?v7) 
                          (pred_2 ?v4) (pred_2 ?v7) (pred_4 ?v4))
       :effect (and  (pred_4 ?v7)
		     (not (pred_4 ?v4))))


   (:action op_3
       :parameters (?v1 ?v8)
       :precondition  (and  (pred_5 ?v1) (pred_2 ?v8)
			    (pred_1 ?v1 ?v8) (pred_4 ?v8) (pred_6))
       :effect (and (pred_3 ?v1)
		    (not (pred_1 ?v1 ?v8)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v1  ?v8)
       :precondition  (and  (pred_5 ?v1) (pred_2 ?v8)
			    (pred_3 ?v1) (pred_4 ?v8))
       :effect (and (pred_1 ?v1 ?v8)
		    (pred_6)
		    (not (pred_3 ?v1)))))
