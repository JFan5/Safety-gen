(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_02 - type_1
obj_06 obj_08 obj_09 obj_05 - type_3
obj_03 obj_12 obj_01 - type_2
obj_10 obj_07 obj_11 - object)
(:init
(pred_1 obj_04 obj_03)
(pred_4 obj_04 obj_06)
(pred_4 obj_04 obj_08)
(pred_1 obj_02 obj_01)
(pred_4 obj_02 obj_09)
(pred_4 obj_02 obj_05)
(pred_2 obj_10 obj_12)
(pred_2 obj_07 obj_01)
(pred_2 obj_11 obj_03)
)
(:goal
(and
(pred_2 obj_10 obj_12)
(pred_2 obj_07 obj_03)
(pred_2 obj_11 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_04 obj_03) (pred_1 obj_02 obj_03))))
  )
)
)