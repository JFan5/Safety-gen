(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v8)
		(pred_2 ?v5)
		(pred_1 ?v4)
		(pred_5 ?v4)
		(pred_3 ?v5 ?v4)
		(pred_6)
		(pred_4 ?v5))

   (:action op_2
       :parameters  (?v6 ?v1)
       :precondition (and (not-eq ?v6 ?v1) 
                          (pred_1 ?v6) (pred_1 ?v1) (pred_5 ?v6))
       :effect (and  (pred_5 ?v1)
		     (not (pred_5 ?v6))))


   (:action op_3
       :parameters (?v3 ?v7)
       :precondition  (and  (pred_2 ?v3) (pred_1 ?v7)
			    (pred_3 ?v3 ?v7) (pred_5 ?v7) (pred_6))
       :effect (and (pred_4 ?v3)
		    (not (pred_3 ?v3 ?v7)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v3  ?v7)
       :precondition  (and  (pred_2 ?v3) (pred_1 ?v7)
			    (pred_4 ?v3) (pred_5 ?v7))
       :effect (and (pred_3 ?v3 ?v7)
		    (pred_6)
		    (not (pred_4 ?v3)))))
