(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v2)
		(pred_2 ?v4)
		(pred_5 ?v8)
		(pred_4 ?v8)
		(pred_1 ?v4 ?v8)
		(pred_3)
		(pred_6 ?v4))

   (:action op_1
       :parameters  (?v7 ?v5)
       :precondition (and (not-eq ?v7 ?v5) 
                          (pred_5 ?v7) (pred_5 ?v5) (pred_4 ?v7))
       :effect (and  (pred_4 ?v5)
		     (not (pred_4 ?v7))))


   (:action op_2
       :parameters (?v1 ?v6)
       :precondition  (and  (pred_2 ?v1) (pred_5 ?v6)
			    (pred_1 ?v1 ?v6) (pred_4 ?v6) (pred_3))
       :effect (and (pred_6 ?v1)
		    (not (pred_1 ?v1 ?v6)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v1  ?v6)
       :precondition  (and  (pred_2 ?v1) (pred_5 ?v6)
			    (pred_6 ?v1) (pred_4 ?v6))
       :effect (and (pred_1 ?v1 ?v6)
		    (pred_3)
		    (not (pred_6 ?v1)))))
