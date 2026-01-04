(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v1)
		(pred_2 ?v8)
		(pred_1 ?v2)
		(pred_6 ?v2)
		(pred_4 ?v8 ?v2)
		(pred_3)
		(pred_5 ?v8))

   (:action op_3
       :parameters  (?v4 ?v7)
       :precondition (and (not-eq ?v4 ?v7) 
                          (pred_1 ?v4) (pred_1 ?v7) (pred_6 ?v4))
       :effect (and  (pred_6 ?v7)
		     (not (pred_6 ?v4))))


   (:action op_2
       :parameters (?v3 ?v6)
       :precondition  (and  (pred_2 ?v3) (pred_1 ?v6)
			    (pred_4 ?v3 ?v6) (pred_6 ?v6) (pred_3))
       :effect (and (pred_5 ?v3)
		    (not (pred_4 ?v3 ?v6)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v3  ?v6)
       :precondition  (and  (pred_2 ?v3) (pred_1 ?v6)
			    (pred_5 ?v3) (pred_6 ?v6))
       :effect (and (pred_4 ?v3 ?v6)
		    (pred_3)
		    (not (pred_5 ?v3)))))
