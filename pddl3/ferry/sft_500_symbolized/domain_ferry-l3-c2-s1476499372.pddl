(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v2)
		(pred_2 ?v7)
		(pred_6 ?v1)
		(pred_5 ?v1)
		(pred_4 ?v7 ?v1)
		(pred_1)
		(pred_3 ?v7))

   (:action op_3
       :parameters  (?v4 ?v8)
       :precondition (and (not-eq ?v4 ?v8) 
                          (pred_6 ?v4) (pred_6 ?v8) (pred_5 ?v4))
       :effect (and  (pred_5 ?v8)
		     (not (pred_5 ?v4))))


   (:action op_2
       :parameters (?v3 ?v6)
       :precondition  (and  (pred_2 ?v3) (pred_6 ?v6)
			    (pred_4 ?v3 ?v6) (pred_5 ?v6) (pred_1))
       :effect (and (pred_3 ?v3)
		    (not (pred_4 ?v3 ?v6)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v3  ?v6)
       :precondition  (and  (pred_2 ?v3) (pred_6 ?v6)
			    (pred_3 ?v3) (pred_5 ?v6))
       :effect (and (pred_4 ?v3 ?v6)
		    (pred_1)
		    (not (pred_3 ?v3)))))
