(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v3)
		(pred_1 ?v8)
		(pred_5 ?v5)
		(pred_4 ?v5)
		(pred_2 ?v8 ?v5)
		(pred_6)
		(pred_3 ?v8))

   (:action op_3
       :parameters  (?v6 ?v1)
       :precondition (and (not-eq ?v6 ?v1) 
                          (pred_5 ?v6) (pred_5 ?v1) (pred_4 ?v6))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v6))))


   (:action op_1
       :parameters (?v7 ?v4)
       :precondition  (and  (pred_1 ?v7) (pred_5 ?v4)
			    (pred_2 ?v7 ?v4) (pred_4 ?v4) (pred_6))
       :effect (and (pred_3 ?v7)
		    (not (pred_2 ?v7 ?v4)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v7  ?v4)
       :precondition  (and  (pred_1 ?v7) (pred_5 ?v4)
			    (pred_3 ?v7) (pred_4 ?v4))
       :effect (and (pred_2 ?v7 ?v4)
		    (pred_6)
		    (not (pred_3 ?v7)))))
