(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v2)
		(pred_1 ?v4)
		(pred_3 ?v8)
		(pred_4 ?v8)
		(pred_2 ?v4 ?v8)
		(pred_6)
		(pred_5 ?v4))

   (:action op_1
       :parameters  (?v6 ?v1)
       :precondition (and (not-eq ?v6 ?v1) 
                          (pred_3 ?v6) (pred_3 ?v1) (pred_4 ?v6))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v6))))


   (:action op_2
       :parameters (?v7 ?v5)
       :precondition  (and  (pred_1 ?v7) (pred_3 ?v5)
			    (pred_2 ?v7 ?v5) (pred_4 ?v5) (pred_6))
       :effect (and (pred_5 ?v7)
		    (not (pred_2 ?v7 ?v5)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v7  ?v5)
       :precondition  (and  (pred_1 ?v7) (pred_3 ?v5)
			    (pred_5 ?v7) (pred_4 ?v5))
       :effect (and (pred_2 ?v7 ?v5)
		    (pred_6)
		    (not (pred_5 ?v7)))))
