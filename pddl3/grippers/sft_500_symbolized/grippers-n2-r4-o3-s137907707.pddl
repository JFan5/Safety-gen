(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_11 - type_1
obj_13 obj_02 obj_12 obj_06 - type_2
obj_07 obj_01 obj_04 obj_08 - type_3
obj_09 obj_03 obj_05 - object)
(:init
(pred_1 obj_10 obj_07)
(pred_3 obj_10 obj_13)
(pred_3 obj_10 obj_02)
(pred_1 obj_11 obj_04)
(pred_3 obj_11 obj_12)
(pred_3 obj_11 obj_06)
(pred_2 obj_09 obj_07)
(pred_2 obj_03 obj_08)
(pred_2 obj_05 obj_04)
)
(:goal
(and
(pred_2 obj_09 obj_04)
(pred_2 obj_03 obj_01)
(pred_2 obj_05 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_10 obj_08) (pred_1 obj_11 obj_08))))
  )
)
)