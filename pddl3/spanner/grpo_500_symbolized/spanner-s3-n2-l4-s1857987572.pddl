; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1857987572 --problem-name spanner-s3-n2-l4-s1857987572
(define (problem spanner-s3-n2-l4-s1857987572)
 (:domain spanner)
 (:objects 
     obj_09 - type_4
     obj_02 obj_07 obj_03 - type_5
     obj_10 obj_06 - type_1
     obj_08 obj_05 obj_12 obj_04 - type_3
     obj_11 obj_01 - type_3
    )
 (:init 
    (pred_3 obj_09 obj_11)
    (pred_3 obj_02 obj_04)
    (pred_1 obj_02)
    (pred_3 obj_07 obj_04)
    (pred_1 obj_07)
    (pred_3 obj_03 obj_08)
    (pred_1 obj_03)
    (pred_5 obj_10)
    (pred_3 obj_10 obj_01)
    (pred_5 obj_06)
    (pred_3 obj_06 obj_01)
    (pred_4 obj_11 obj_08)
    (pred_4 obj_04 obj_01)
    (pred_4 obj_08 obj_05)
    (pred_4 obj_05 obj_12)
    (pred_4 obj_12 obj_04)
)
 (:goal
  (and
   (pred_2 obj_10)
   (pred_2 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_10)) (not (pred_2 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_11)))
  )
)
)
