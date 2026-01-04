(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v3)
		(pred_2 ?v4)
		(pred_5 ?v8)
		(pred_6 ?v8)
		(pred_3 ?v4 ?v8)
		(pred_1)
		(pred_4 ?v4))

   (:action op_2
       :parameters  (?v7 ?v5)
       :precondition (and (not-eq ?v7 ?v5) 
                          (pred_5 ?v7) (pred_5 ?v5) (pred_6 ?v7))
       :effect (and  (pred_6 ?v5)
		     (not (pred_6 ?v7))))


   (:action op_1
       :parameters (?v1 ?v6)
       :precondition  (and  (pred_2 ?v1) (pred_5 ?v6)
			    (pred_3 ?v1 ?v6) (pred_6 ?v6) (pred_1))
       :effect (and (pred_4 ?v1)
		    (not (pred_3 ?v1 ?v6)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v1  ?v6)
       :precondition  (and  (pred_2 ?v1) (pred_5 ?v6)
			    (pred_4 ?v1) (pred_6 ?v6))
       :effect (and (pred_3 ?v1 ?v6)
		    (pred_1)
		    (not (pred_4 ?v1)))))
