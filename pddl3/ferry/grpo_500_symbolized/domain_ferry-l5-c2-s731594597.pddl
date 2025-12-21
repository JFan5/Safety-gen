(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v4)
		(pred_6 ?v3)
		(pred_5 ?v5)
		(pred_2 ?v5)
		(pred_4 ?v3 ?v5)
		(pred_3)
		(pred_1 ?v3))

   (:action op_3
       :parameters  (?v1 ?v8)
       :precondition (and (not-eq ?v1 ?v8) 
                          (pred_5 ?v1) (pred_5 ?v8) (pred_2 ?v1))
       :effect (and  (pred_2 ?v8)
		     (not (pred_2 ?v1))))


   (:action op_1
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_6 ?v7) (pred_5 ?v6)
			    (pred_4 ?v7 ?v6) (pred_2 ?v6) (pred_3))
       :effect (and (pred_1 ?v7)
		    (not (pred_4 ?v7 ?v6)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_6 ?v7) (pred_5 ?v6)
			    (pred_1 ?v7) (pred_2 ?v6))
       :effect (and (pred_4 ?v7 ?v6)
		    (pred_3)
		    (not (pred_1 ?v7)))))
