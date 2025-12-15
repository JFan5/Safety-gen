(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_02 - type_1
obj_12 obj_10 obj_01 obj_11 - type_3
obj_06 obj_07 obj_08 obj_03 - type_2
obj_09 obj_05 obj_04 - object)
(:init
(pred_3 obj_13 obj_06)
(pred_4 obj_13 obj_12)
(pred_4 obj_13 obj_10)
(pred_3 obj_02 obj_07)
(pred_4 obj_02 obj_01)
(pred_4 obj_02 obj_11)
(pred_2 obj_09 obj_07)
(pred_2 obj_05 obj_07)
(pred_2 obj_04 obj_03)
)
(:goal
(and
(pred_2 obj_09 obj_06)
(pred_2 obj_05 obj_08)
(pred_2 obj_04 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_13 obj_06) (pred_3 obj_02 obj_06))))
  )
)
)