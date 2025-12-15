; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 715808391 --problem-name spanner-s4-n3-l4-s715808391
(define (problem spanner-s4-n3-l4-s715808391)
 (:domain spanner)
 (:objects 
     obj_04 - type_1
     obj_03 obj_14 obj_07 obj_01 - type_3
     obj_02 obj_05 obj_11 - type_4
     obj_13 obj_12 obj_06 obj_08 - type_2
     obj_09 obj_10 - type_2
    )
 (:init 
    (pred_3 obj_04 obj_09)
    (pred_3 obj_03 obj_12)
    (pred_6 obj_03)
    (pred_3 obj_14 obj_12)
    (pred_6 obj_14)
    (pred_3 obj_07 obj_06)
    (pred_6 obj_07)
    (pred_3 obj_01 obj_06)
    (pred_6 obj_01)
    (pred_1 obj_02)
    (pred_3 obj_02 obj_10)
    (pred_1 obj_05)
    (pred_3 obj_05 obj_10)
    (pred_1 obj_11)
    (pred_3 obj_11 obj_10)
    (pred_4 obj_09 obj_13)
    (pred_4 obj_08 obj_10)
    (pred_4 obj_13 obj_12)
    (pred_4 obj_12 obj_06)
    (pred_4 obj_06 obj_08)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_05)
   (pred_2 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_05))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
