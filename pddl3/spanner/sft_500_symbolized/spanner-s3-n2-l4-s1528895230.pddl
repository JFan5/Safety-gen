; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1528895230 --problem-name spanner-s3-n2-l4-s1528895230
(define (problem spanner-s3-n2-l4-s1528895230)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_05 obj_09 obj_07 - type_4
     obj_12 obj_11 - type_3
     obj_10 obj_08 obj_01 obj_04 - type_1
     obj_02 obj_06 - type_1
    )
 (:init 
    (pred_3 obj_03 obj_02)
    (pred_3 obj_05 obj_04)
    (pred_4 obj_05)
    (pred_3 obj_09 obj_10)
    (pred_4 obj_09)
    (pred_3 obj_07 obj_10)
    (pred_4 obj_07)
    (pred_6 obj_12)
    (pred_3 obj_12 obj_06)
    (pred_6 obj_11)
    (pred_3 obj_11 obj_06)
    (pred_1 obj_02 obj_10)
    (pred_1 obj_04 obj_06)
    (pred_1 obj_10 obj_08)
    (pred_1 obj_08 obj_01)
    (pred_1 obj_01 obj_04)
)
 (:goal
  (and
   (pred_5 obj_12)
   (pred_5 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_12)) (not (pred_5 obj_11))))
    (forall (?m - type_5) (at-most-once (pred_3 ?m obj_02)))
  )
)
)
