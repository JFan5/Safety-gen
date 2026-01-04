(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_12 - type_2
obj_11 obj_09 obj_10 obj_08 - type_3
obj_01 obj_04 obj_03 - type_1
obj_07 obj_02 obj_06 - object)
(:init
(pred_1 obj_05 obj_03)
(pred_2 obj_05 obj_11)
(pred_2 obj_05 obj_09)
(pred_1 obj_12 obj_04)
(pred_2 obj_12 obj_10)
(pred_2 obj_12 obj_08)
(pred_4 obj_07 obj_01)
(pred_4 obj_02 obj_01)
(pred_4 obj_06 obj_04)
)
(:goal
(and
(pred_4 obj_07 obj_03)
(pred_4 obj_02 obj_04)
(pred_4 obj_06 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_05 obj_03) (pred_1 obj_12 obj_03))))
  )
)
)