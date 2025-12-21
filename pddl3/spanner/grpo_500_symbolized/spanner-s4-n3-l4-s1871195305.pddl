; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 1871195305 --problem-name spanner-s4-n3-l4-s1871195305
(define (problem spanner-s4-n3-l4-s1871195305)
 (:domain spanner)
 (:objects 
     obj_05 - type_5
     obj_07 obj_13 obj_01 obj_06 - type_3
     obj_10 obj_14 obj_04 - type_1
     obj_12 obj_08 obj_09 obj_11 - type_2
     obj_03 obj_02 - type_2
    )
 (:init 
    (pred_6 obj_05 obj_03)
    (pred_6 obj_07 obj_09)
    (pred_5 obj_07)
    (pred_6 obj_13 obj_12)
    (pred_5 obj_13)
    (pred_6 obj_01 obj_08)
    (pred_5 obj_01)
    (pred_6 obj_06 obj_09)
    (pred_5 obj_06)
    (pred_4 obj_10)
    (pred_6 obj_10 obj_02)
    (pred_4 obj_14)
    (pred_6 obj_14 obj_02)
    (pred_4 obj_04)
    (pred_6 obj_04 obj_02)
    (pred_3 obj_03 obj_12)
    (pred_3 obj_11 obj_02)
    (pred_3 obj_12 obj_08)
    (pred_3 obj_08 obj_09)
    (pred_3 obj_09 obj_11)
)
 (:goal
  (and
   (pred_1 obj_10)
   (pred_1 obj_14)
   (pred_1 obj_04)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_14)) (not (pred_1 obj_04))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
