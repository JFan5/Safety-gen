(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_04 - type_1
obj_11 obj_01 obj_09 obj_07 - type_3
obj_13 obj_08 obj_12 obj_06 - type_2
obj_10 obj_03 obj_02 - object)
(:init
(pred_4 obj_05 obj_06)
(pred_2 obj_05 obj_11)
(pred_2 obj_05 obj_01)
(pred_4 obj_04 obj_08)
(pred_2 obj_04 obj_09)
(pred_2 obj_04 obj_07)
(pred_3 obj_10 obj_08)
(pred_3 obj_03 obj_12)
(pred_3 obj_02 obj_13)
)
(:goal
(and
(pred_3 obj_10 obj_06)
(pred_3 obj_03 obj_06)
(pred_3 obj_02 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_05 obj_06) (pred_4 obj_04 obj_06))))
  )
)
)