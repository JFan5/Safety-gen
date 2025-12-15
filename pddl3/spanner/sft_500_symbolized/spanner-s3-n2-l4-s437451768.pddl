; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 437451768 --problem-name spanner-s3-n2-l4-s437451768
(define (problem spanner-s3-n2-l4-s437451768)
 (:domain spanner)
 (:objects 
     obj_11 - type_3
     obj_08 obj_09 obj_07 - type_4
     obj_06 obj_05 - type_2
     obj_02 obj_04 obj_10 obj_12 - type_5
     obj_03 obj_01 - type_5
    )
 (:init 
    (pred_6 obj_11 obj_03)
    (pred_6 obj_08 obj_12)
    (pred_5 obj_08)
    (pred_6 obj_09 obj_12)
    (pred_5 obj_09)
    (pred_6 obj_07 obj_12)
    (pred_5 obj_07)
    (pred_1 obj_06)
    (pred_6 obj_06 obj_01)
    (pred_1 obj_05)
    (pred_6 obj_05 obj_01)
    (pred_3 obj_03 obj_02)
    (pred_3 obj_12 obj_01)
    (pred_3 obj_02 obj_04)
    (pred_3 obj_04 obj_10)
    (pred_3 obj_10 obj_12)
)
 (:goal
  (and
   (pred_2 obj_06)
   (pred_2 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_06)) (not (pred_2 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
