(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_07 - type_1
obj_12 obj_11 obj_10 obj_03 - type_2
obj_08 obj_04 obj_02 obj_06 - type_3
obj_09 obj_13 obj_05 - object)
(:init
(pred_3 obj_01 obj_04)
(pred_1 obj_01 obj_12)
(pred_1 obj_01 obj_11)
(pred_3 obj_07 obj_02)
(pred_1 obj_07 obj_10)
(pred_1 obj_07 obj_03)
(pred_2 obj_09 obj_06)
(pred_2 obj_13 obj_06)
(pred_2 obj_05 obj_06)
)
(:goal
(and
(pred_2 obj_09 obj_04)
(pred_2 obj_13 obj_04)
(pred_2 obj_05 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_01 obj_06) (pred_3 obj_07 obj_06))))
  )
)
)