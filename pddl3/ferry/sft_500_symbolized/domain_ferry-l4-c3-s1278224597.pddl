(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_1 ?v5)
		(pred_4 ?v4)
		(pred_2 ?v4)
		(pred_3 ?v5 ?v4)
		(pred_6)
		(pred_5 ?v5))

   (:action op_1
       :parameters  (?v6 ?v2)
       :precondition (and (not-eq ?v6 ?v2) 
                          (pred_4 ?v6) (pred_4 ?v2) (pred_2 ?v6))
       :effect (and  (pred_2 ?v2)
		     (not (pred_2 ?v6))))


   (:action op_3
       :parameters (?v3 ?v7)
       :precondition  (and  (pred_1 ?v3) (pred_4 ?v7)
			    (pred_3 ?v3 ?v7) (pred_2 ?v7) (pred_6))
       :effect (and (pred_5 ?v3)
		    (not (pred_3 ?v3 ?v7)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v3  ?v7)
       :precondition  (and  (pred_1 ?v3) (pred_4 ?v7)
			    (pred_5 ?v3) (pred_2 ?v7))
       :effect (and (pred_3 ?v3 ?v7)
		    (pred_6)
		    (not (pred_5 ?v3)))))
