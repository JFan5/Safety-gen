; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 715808391 --problem-name spanner-s4-n3-l4-s715808391
(define (problem spanner-s4-n3-l4-s715808391)
 (:domain spanner)
 (:objects 
     obj_09 - type_2
     obj_06 obj_03 obj_05 obj_10 - type_3
     obj_13 obj_04 obj_12 - type_4
     obj_01 obj_08 obj_02 obj_11 - type_5
     obj_07 obj_14 - type_5
    )
 (:init 
    (pred_3 obj_09 obj_07)
    (pred_3 obj_06 obj_08)
    (pred_1 obj_06)
    (pred_3 obj_03 obj_08)
    (pred_1 obj_03)
    (pred_3 obj_05 obj_02)
    (pred_1 obj_05)
    (pred_3 obj_10 obj_02)
    (pred_1 obj_10)
    (pred_5 obj_13)
    (pred_3 obj_13 obj_14)
    (pred_5 obj_04)
    (pred_3 obj_04 obj_14)
    (pred_5 obj_12)
    (pred_3 obj_12 obj_14)
    (pred_6 obj_07 obj_01)
    (pred_6 obj_11 obj_14)
    (pred_6 obj_01 obj_08)
    (pred_6 obj_08 obj_02)
    (pred_6 obj_02 obj_11)
)
 (:goal
  (and
   (pred_4 obj_13)
   (pred_4 obj_04)
   (pred_4 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_13)) (not (pred_4 obj_04))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
