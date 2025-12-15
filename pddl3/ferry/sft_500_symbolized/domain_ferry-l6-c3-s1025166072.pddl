(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v1)
		(pred_4 ?v8)
		(pred_5 ?v2)
		(pred_3 ?v2)
		(pred_1 ?v8 ?v2)
		(pred_6)
		(pred_2 ?v8))

   (:action op_3
       :parameters  (?v6 ?v3)
       :precondition (and (not-eq ?v6 ?v3) 
                          (pred_5 ?v6) (pred_5 ?v3) (pred_3 ?v6))
       :effect (and  (pred_3 ?v3)
		     (not (pred_3 ?v6))))


   (:action op_1
       :parameters (?v4 ?v7)
       :precondition  (and  (pred_4 ?v4) (pred_5 ?v7)
			    (pred_1 ?v4 ?v7) (pred_3 ?v7) (pred_6))
       :effect (and (pred_2 ?v4)
		    (not (pred_1 ?v4 ?v7)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v4  ?v7)
       :precondition  (and  (pred_4 ?v4) (pred_5 ?v7)
			    (pred_2 ?v4) (pred_3 ?v7))
       :effect (and (pred_1 ?v4 ?v7)
		    (pred_6)
		    (not (pred_2 ?v4)))))
