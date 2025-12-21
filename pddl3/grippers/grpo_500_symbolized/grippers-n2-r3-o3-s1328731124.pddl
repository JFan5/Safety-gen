(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_12 - type_1
obj_03 obj_06 obj_11 obj_05 - type_3
obj_09 obj_01 obj_10 - type_2
obj_08 obj_02 obj_07 - object)
(:init
(pred_4 obj_04 obj_01)
(pred_2 obj_04 obj_03)
(pred_2 obj_04 obj_06)
(pred_4 obj_12 obj_10)
(pred_2 obj_12 obj_11)
(pred_2 obj_12 obj_05)
(pred_3 obj_08 obj_01)
(pred_3 obj_02 obj_09)
(pred_3 obj_07 obj_10)
)
(:goal
(and
(pred_3 obj_08 obj_09)
(pred_3 obj_02 obj_10)
(pred_3 obj_07 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_04 obj_09) (pred_4 obj_12 obj_09))))
  )
)
)