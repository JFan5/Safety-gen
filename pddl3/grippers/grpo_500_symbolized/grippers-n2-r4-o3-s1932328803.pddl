(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_01 - type_1
obj_11 obj_13 obj_07 obj_09 - type_3
obj_03 obj_05 obj_06 obj_12 - type_2
obj_02 obj_10 obj_04 - object)
(:init
(pred_4 obj_08 obj_06)
(pred_2 obj_08 obj_11)
(pred_2 obj_08 obj_13)
(pred_4 obj_01 obj_05)
(pred_2 obj_01 obj_07)
(pred_2 obj_01 obj_09)
(pred_3 obj_02 obj_12)
(pred_3 obj_10 obj_12)
(pred_3 obj_04 obj_12)
)
(:goal
(and
(pred_3 obj_02 obj_06)
(pred_3 obj_10 obj_12)
(pred_3 obj_04 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_08 obj_12) (pred_4 obj_01 obj_12))))
  )
)
)