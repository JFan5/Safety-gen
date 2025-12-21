(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_06 - type_1
obj_11 obj_02 obj_01 obj_10 - type_2
obj_09 obj_07 obj_03 obj_13 - type_3
obj_05 obj_08 obj_12 - object)
(:init
(pred_1 obj_04 obj_07)
(pred_3 obj_04 obj_11)
(pred_3 obj_04 obj_02)
(pred_1 obj_06 obj_13)
(pred_3 obj_06 obj_01)
(pred_3 obj_06 obj_10)
(pred_2 obj_05 obj_09)
(pred_2 obj_08 obj_13)
(pred_2 obj_12 obj_07)
)
(:goal
(and
(pred_2 obj_05 obj_13)
(pred_2 obj_08 obj_13)
(pred_2 obj_12 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_04 obj_09) (pred_1 obj_06 obj_09))))
  )
)
)