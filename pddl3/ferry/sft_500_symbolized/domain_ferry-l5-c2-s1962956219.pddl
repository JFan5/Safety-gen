(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v5)
		(pred_2 ?v2)
		(pred_6 ?v8)
		(pred_1 ?v8)
		(pred_5 ?v2 ?v8)
		(pred_3)
		(pred_4 ?v2))

   (:action op_3
       :parameters  (?v7 ?v1)
       :precondition (and (not-eq ?v7 ?v1) 
                          (pred_6 ?v7) (pred_6 ?v1) (pred_1 ?v7))
       :effect (and  (pred_1 ?v1)
		     (not (pred_1 ?v7))))


   (:action op_1
       :parameters (?v6 ?v3)
       :precondition  (and  (pred_2 ?v6) (pred_6 ?v3)
			    (pred_5 ?v6 ?v3) (pred_1 ?v3) (pred_3))
       :effect (and (pred_4 ?v6)
		    (not (pred_5 ?v6 ?v3)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v6  ?v3)
       :precondition  (and  (pred_2 ?v6) (pred_6 ?v3)
			    (pred_4 ?v6) (pred_1 ?v3))
       :effect (and (pred_5 ?v6 ?v3)
		    (pred_3)
		    (not (pred_4 ?v6)))))
