(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v6 ?v12)
             (pred_2 ?v2 ?v13)
             (pred_11 ?v6 ?v13)
             (pred_8 ?v5 ?v6 )
	     (pred_3 ?v6)
             (pred_5 ?v9)
             (pred_12 ?v2)
             (pred_7 ?v13)
             (pred_6 ?v6)
             (pred_1 ?v2)
             (pred_10 ?v6)
             (pred_9 ))



(:action op_3
:parameters (?v11 ?v7 ?v4 ?v10)
:precondition (and (pred_5 ?v11) (pred_5 ?v7) (pred_12 ?v4) (pred_7 ?v10)
          (pred_4 ?v11 ?v7) (pred_2 ?v4 ?v10)
                   (pred_11 ?v7 ?v10) (pred_3 ?v11) 
                   (pred_6 ?v7) (pred_1 ?v4))
:effect (and  (pred_10 ?v7) (not (pred_6 ?v7))))


(:action op_1
:parameters (?v11 ?v8)
:precondition (and (pred_5 ?v11) (pred_5 ?v8)
               (pred_3 ?v11) (pred_4 ?v11 ?v8) (pred_10 ?v8))
:effect (and (pred_3 ?v8) (not (pred_3 ?v11))))

(:action op_4
:parameters (?v11 ?v4)
:precondition (and (pred_5 ?v11) (pred_12 ?v4) 
                  (pred_3 ?v11) (pred_8 ?v4 ?v11) (pred_9 ))
:effect (and (pred_1 ?v4)
   (not (pred_8 ?v4 ?v11)) (not (pred_9 ))))


(:action op_5
:parameters (?v11 ?v3 ?v1)
:precondition (and (pred_5 ?v11) (pred_12 ?v3) (pred_12 ?v1)
                  (pred_3 ?v11) (pred_1 ?v1) (pred_8 ?v3 ?v11))
:effect (and (pred_1 ?v3) (pred_8 ?v1 ?v11)
        (not (pred_1 ?v1)) (not (pred_8 ?v3 ?v11))))

(:action op_2
:parameters (?v11 ?v4)
:precondition (and (pred_5 ?v11) (pred_12 ?v4) 
                  (pred_3 ?v11) (pred_1 ?v4))
:effect (and (pred_9 ) (pred_8 ?v4 ?v11) (not (pred_1 ?v4)))))


	
