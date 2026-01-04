(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v3)
		(pred_4 ?v4)
		(pred_1 ?v2)
		(pred_3 ?v2)
		(pred_6 ?v4 ?v2)
		(pred_2)
		(pred_5 ?v4))

   (:action op_3
       :parameters  (?v6 ?v8)
       :precondition (and (not-eq ?v6 ?v8) 
                          (pred_1 ?v6) (pred_1 ?v8) (pred_3 ?v6))
       :effect (and  (pred_3 ?v8)
		     (not (pred_3 ?v6))))


   (:action op_2
       :parameters (?v7 ?v1)
       :precondition  (and  (pred_4 ?v7) (pred_1 ?v1)
			    (pred_6 ?v7 ?v1) (pred_3 ?v1) (pred_2))
       :effect (and (pred_5 ?v7)
		    (not (pred_6 ?v7 ?v1)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v7  ?v1)
       :precondition  (and  (pred_4 ?v7) (pred_1 ?v1)
			    (pred_5 ?v7) (pred_3 ?v1))
       :effect (and (pred_6 ?v7 ?v1)
		    (pred_2)
		    (not (pred_5 ?v7)))))
