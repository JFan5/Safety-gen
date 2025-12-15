(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v5)
		(pred_3 ?v2)
		(pred_2 ?v8)
		(pred_4 ?v8)
		(pred_1 ?v2 ?v8)
		(pred_6)
		(pred_5 ?v2))

   (:action op_2
       :parameters  (?v6 ?v3)
       :precondition (and (not-eq ?v6 ?v3) 
                          (pred_2 ?v6) (pred_2 ?v3) (pred_4 ?v6))
       :effect (and  (pred_4 ?v3)
		     (not (pred_4 ?v6))))


   (:action op_3
       :parameters (?v7 ?v1)
       :precondition  (and  (pred_3 ?v7) (pred_2 ?v1)
			    (pred_1 ?v7 ?v1) (pred_4 ?v1) (pred_6))
       :effect (and (pred_5 ?v7)
		    (not (pred_1 ?v7 ?v1)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v7  ?v1)
       :precondition  (and  (pred_3 ?v7) (pred_2 ?v1)
			    (pred_5 ?v7) (pred_4 ?v1))
       :effect (and (pred_1 ?v7 ?v1)
		    (pred_6)
		    (not (pred_5 ?v7)))))
