(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_07 - type_2
obj_09 obj_01 obj_10 obj_02 - type_3
obj_08 obj_11 obj_03 - type_1
obj_05 obj_06 obj_12 - object)
(:init
(pred_4 obj_04 obj_11)
(pred_2 obj_04 obj_09)
(pred_2 obj_04 obj_01)
(pred_4 obj_07 obj_03)
(pred_2 obj_07 obj_10)
(pred_2 obj_07 obj_02)
(pred_1 obj_05 obj_08)
(pred_1 obj_06 obj_11)
(pred_1 obj_12 obj_08)
)
(:goal
(and
(pred_1 obj_05 obj_03)
(pred_1 obj_06 obj_11)
(pred_1 obj_12 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_04 obj_03) (pred_4 obj_07 obj_03))))
  )
)
)