(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v2)
		(pred_2 ?v5)
		(pred_6 ?v7)
		(pred_5 ?v7)
		(pred_3 ?v5 ?v7)
		(pred_1)
		(pred_4 ?v5))

   (:action op_1
       :parameters  (?v1 ?v3)
       :precondition (and (not-eq ?v1 ?v3) 
                          (pred_6 ?v1) (pred_6 ?v3) (pred_5 ?v1))
       :effect (and  (pred_5 ?v3)
		     (not (pred_5 ?v1))))


   (:action op_3
       :parameters (?v4 ?v6)
       :precondition  (and  (pred_2 ?v4) (pred_6 ?v6)
			    (pred_3 ?v4 ?v6) (pred_5 ?v6) (pred_1))
       :effect (and (pred_4 ?v4)
		    (not (pred_3 ?v4 ?v6)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v4  ?v6)
       :precondition  (and  (pred_2 ?v4) (pred_6 ?v6)
			    (pred_4 ?v4) (pred_5 ?v6))
       :effect (and (pred_3 ?v4 ?v6)
		    (pred_1)
		    (not (pred_4 ?v4)))))
