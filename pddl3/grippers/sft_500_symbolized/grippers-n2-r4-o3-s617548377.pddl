(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_04 - type_3
obj_05 obj_11 obj_03 obj_07 - type_1
obj_01 obj_12 obj_02 obj_09 - type_2
obj_08 obj_10 obj_06 - object)
(:init
(pred_4 obj_13 obj_02)
(pred_1 obj_13 obj_05)
(pred_1 obj_13 obj_11)
(pred_4 obj_04 obj_09)
(pred_1 obj_04 obj_03)
(pred_1 obj_04 obj_07)
(pred_2 obj_08 obj_01)
(pred_2 obj_10 obj_12)
(pred_2 obj_06 obj_12)
)
(:goal
(and
(pred_2 obj_08 obj_12)
(pred_2 obj_10 obj_09)
(pred_2 obj_06 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_13 obj_12) (pred_4 obj_04 obj_12))))
    (always (not (and (pred_4 obj_13 obj_09) (pred_4 obj_04 obj_09))))
  )
)
)