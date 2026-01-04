(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_05 - type_3
obj_03 obj_13 obj_02 obj_07 - type_2
obj_08 obj_04 obj_10 obj_06 - type_1
obj_01 obj_11 obj_09 - object)
(:init
(pred_1 obj_12 obj_08)
(pred_3 obj_12 obj_03)
(pred_3 obj_12 obj_13)
(pred_1 obj_05 obj_06)
(pred_3 obj_05 obj_02)
(pred_3 obj_05 obj_07)
(pred_4 obj_01 obj_10)
(pred_4 obj_11 obj_08)
(pred_4 obj_09 obj_06)
)
(:goal
(and
(pred_4 obj_01 obj_10)
(pred_4 obj_11 obj_06)
(pred_4 obj_09 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_12 obj_06) (pred_1 obj_05 obj_06))))
  )
)
)