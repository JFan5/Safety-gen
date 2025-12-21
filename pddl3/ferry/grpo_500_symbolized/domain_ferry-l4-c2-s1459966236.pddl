(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v2)
		(pred_3 ?v1)
		(pred_4 ?v3)
		(pred_6 ?v3)
		(pred_5 ?v1 ?v3)
		(pred_1)
		(pred_2 ?v1))

   (:action op_1
       :parameters  (?v7 ?v5)
       :precondition (and (not-eq ?v7 ?v5) 
                          (pred_4 ?v7) (pred_4 ?v5) (pred_6 ?v7))
       :effect (and  (pred_6 ?v5)
		     (not (pred_6 ?v7))))


   (:action op_2
       :parameters (?v8 ?v6)
       :precondition  (and  (pred_3 ?v8) (pred_4 ?v6)
			    (pred_5 ?v8 ?v6) (pred_6 ?v6) (pred_1))
       :effect (and (pred_2 ?v8)
		    (not (pred_5 ?v8 ?v6)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v8  ?v6)
       :precondition  (and  (pred_3 ?v8) (pred_4 ?v6)
			    (pred_2 ?v8) (pred_6 ?v6))
       :effect (and (pred_5 ?v8 ?v6)
		    (pred_1)
		    (not (pred_2 ?v8)))))
