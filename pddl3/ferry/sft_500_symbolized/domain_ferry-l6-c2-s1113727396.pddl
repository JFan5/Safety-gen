(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v3)
		(pred_6 ?v2)
		(pred_4 ?v8)
		(pred_5 ?v8)
		(pred_1 ?v2 ?v8)
		(pred_2)
		(pred_3 ?v2))

   (:action op_2
       :parameters  (?v7 ?v5)
       :precondition (and (not-eq ?v7 ?v5) 
                          (pred_4 ?v7) (pred_4 ?v5) (pred_5 ?v7))
       :effect (and  (pred_5 ?v5)
		     (not (pred_5 ?v7))))


   (:action op_1
       :parameters (?v4 ?v6)
       :precondition  (and  (pred_6 ?v4) (pred_4 ?v6)
			    (pred_1 ?v4 ?v6) (pred_5 ?v6) (pred_2))
       :effect (and (pred_3 ?v4)
		    (not (pred_1 ?v4 ?v6)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v4  ?v6)
       :precondition  (and  (pred_6 ?v4) (pred_4 ?v6)
			    (pred_3 ?v4) (pred_5 ?v6))
       :effect (and (pred_1 ?v4 ?v6)
		    (pred_2)
		    (not (pred_3 ?v4)))))
