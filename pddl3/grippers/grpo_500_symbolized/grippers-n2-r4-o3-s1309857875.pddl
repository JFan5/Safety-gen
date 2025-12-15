(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_09 - type_1
obj_07 obj_02 obj_05 obj_13 - type_3
obj_12 obj_01 obj_06 obj_08 - type_2
obj_03 obj_10 obj_04 - object)
(:init
(pred_3 obj_11 obj_01)
(pred_4 obj_11 obj_07)
(pred_4 obj_11 obj_02)
(pred_3 obj_09 obj_12)
(pred_4 obj_09 obj_05)
(pred_4 obj_09 obj_13)
(pred_2 obj_03 obj_08)
(pred_2 obj_10 obj_01)
(pred_2 obj_04 obj_06)
)
(:goal
(and
(pred_2 obj_03 obj_08)
(pred_2 obj_10 obj_01)
(pred_2 obj_04 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_11 obj_08) (pred_3 obj_09 obj_08))))
  )
)
)