(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v3)
		(pred_3 ?v6)
		(pred_4 ?v4)
		(pred_5 ?v4)
		(pred_1 ?v6 ?v4)
		(pred_6)
		(pred_2 ?v6))

   (:action op_3
       :parameters  (?v1 ?v2)
       :precondition (and (not-eq ?v1 ?v2) 
                          (pred_4 ?v1) (pred_4 ?v2) (pred_5 ?v1))
       :effect (and  (pred_5 ?v2)
		     (not (pred_5 ?v1))))


   (:action op_1
       :parameters (?v7 ?v5)
       :precondition  (and  (pred_3 ?v7) (pred_4 ?v5)
			    (pred_1 ?v7 ?v5) (pred_5 ?v5) (pred_6))
       :effect (and (pred_2 ?v7)
		    (not (pred_1 ?v7 ?v5)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v7  ?v5)
       :precondition  (and  (pred_3 ?v7) (pred_4 ?v5)
			    (pred_2 ?v7) (pred_5 ?v5))
       :effect (and (pred_1 ?v7 ?v5)
		    (pred_6)
		    (not (pred_2 ?v7)))))
