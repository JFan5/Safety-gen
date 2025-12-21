(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v8)
		(pred_5 ?v2)
		(pred_2 ?v4)
		(pred_1 ?v4)
		(pred_4 ?v2 ?v4)
		(pred_3)
		(pred_6 ?v2))

   (:action op_1
       :parameters  (?v3 ?v7)
       :precondition (and (not-eq ?v3 ?v7) 
                          (pred_2 ?v3) (pred_2 ?v7) (pred_1 ?v3))
       :effect (and  (pred_1 ?v7)
		     (not (pred_1 ?v3))))


   (:action op_2
       :parameters (?v1 ?v6)
       :precondition  (and  (pred_5 ?v1) (pred_2 ?v6)
			    (pred_4 ?v1 ?v6) (pred_1 ?v6) (pred_3))
       :effect (and (pred_6 ?v1)
		    (not (pred_4 ?v1 ?v6)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v1  ?v6)
       :precondition  (and  (pred_5 ?v1) (pred_2 ?v6)
			    (pred_6 ?v1) (pred_1 ?v6))
       :effect (and (pred_4 ?v1 ?v6)
		    (pred_3)
		    (not (pred_6 ?v1)))))
