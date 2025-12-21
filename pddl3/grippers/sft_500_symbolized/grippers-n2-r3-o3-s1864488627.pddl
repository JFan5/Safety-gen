(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_09 - type_1
obj_06 obj_08 obj_11 obj_02 - type_2
obj_12 obj_03 obj_10 - type_3
obj_01 obj_05 obj_04 - object)
(:init
(pred_1 obj_07 obj_03)
(pred_3 obj_07 obj_06)
(pred_3 obj_07 obj_08)
(pred_1 obj_09 obj_10)
(pred_3 obj_09 obj_11)
(pred_3 obj_09 obj_02)
(pred_2 obj_01 obj_12)
(pred_2 obj_05 obj_12)
(pred_2 obj_04 obj_10)
)
(:goal
(and
(pred_2 obj_01 obj_12)
(pred_2 obj_05 obj_03)
(pred_2 obj_04 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_07 obj_03) (pred_1 obj_09 obj_03))))
  )
)
)