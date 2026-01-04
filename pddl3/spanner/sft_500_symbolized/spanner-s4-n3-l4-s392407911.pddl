; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 392407911 --problem-name spanner-s4-n3-l4-s392407911
(define (problem spanner-s4-n3-l4-s392407911)
 (:domain spanner)
 (:objects 
     obj_14 - type_4
     obj_12 obj_10 obj_02 obj_05 - type_3
     obj_04 obj_07 obj_06 - type_1
     obj_13 obj_09 obj_11 obj_01 - type_5
     obj_03 obj_08 - type_5
    )
 (:init 
    (pred_6 obj_14 obj_03)
    (pred_6 obj_12 obj_11)
    (pred_5 obj_12)
    (pred_6 obj_10 obj_09)
    (pred_5 obj_10)
    (pred_6 obj_02 obj_11)
    (pred_5 obj_02)
    (pred_6 obj_05 obj_11)
    (pred_5 obj_05)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_08)
    (pred_4 obj_07)
    (pred_6 obj_07 obj_08)
    (pred_4 obj_06)
    (pred_6 obj_06 obj_08)
    (pred_2 obj_03 obj_13)
    (pred_2 obj_01 obj_08)
    (pred_2 obj_13 obj_09)
    (pred_2 obj_09 obj_11)
    (pred_2 obj_11 obj_01)
)
 (:goal
  (and
   (pred_1 obj_04)
   (pred_1 obj_07)
   (pred_1 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_07)) (not (pred_1 obj_06))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
