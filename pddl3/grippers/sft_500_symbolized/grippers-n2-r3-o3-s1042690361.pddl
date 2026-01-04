(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_07 - type_1
obj_12 obj_02 obj_11 obj_09 - type_3
obj_10 obj_03 obj_08 - type_2
obj_04 obj_06 obj_01 - object)
(:init
(pred_2 obj_05 obj_10)
(pred_1 obj_05 obj_12)
(pred_1 obj_05 obj_02)
(pred_2 obj_07 obj_03)
(pred_1 obj_07 obj_11)
(pred_1 obj_07 obj_09)
(pred_3 obj_04 obj_03)
(pred_3 obj_06 obj_08)
(pred_3 obj_01 obj_10)
)
(:goal
(and
(pred_3 obj_04 obj_10)
(pred_3 obj_06 obj_10)
(pred_3 obj_01 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_05 obj_03) (pred_2 obj_07 obj_03))))
  )
)
)