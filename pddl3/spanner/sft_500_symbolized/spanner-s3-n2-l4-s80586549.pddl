; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 80586549 --problem-name spanner-s3-n2-l4-s80586549
(define (problem spanner-s3-n2-l4-s80586549)
 (:domain spanner)
 (:objects 
     obj_09 - type_3
     obj_01 obj_10 obj_06 - type_5
     obj_11 obj_07 - type_4
     obj_08 obj_03 obj_12 obj_02 - type_2
     obj_04 obj_05 - type_2
    )
 (:init 
    (pred_2 obj_09 obj_04)
    (pred_2 obj_01 obj_02)
    (pred_1 obj_01)
    (pred_2 obj_10 obj_08)
    (pred_1 obj_10)
    (pred_2 obj_06 obj_08)
    (pred_1 obj_06)
    (pred_5 obj_11)
    (pred_2 obj_11 obj_05)
    (pred_5 obj_07)
    (pred_2 obj_07 obj_05)
    (pred_6 obj_04 obj_08)
    (pred_6 obj_02 obj_05)
    (pred_6 obj_08 obj_03)
    (pred_6 obj_03 obj_12)
    (pred_6 obj_12 obj_02)
)
 (:goal
  (and
   (pred_3 obj_11)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_11)) (not (pred_3 obj_07))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
