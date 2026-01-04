(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_05 obj_09 - type_1
obj_03 obj_10 obj_04 obj_01 - type_3
obj_06 obj_02 obj_07 - type_2
obj_11 obj_08 - object)
(:init
(pred_2 obj_05 obj_06)
(pred_4 obj_05 obj_03)
(pred_4 obj_05 obj_10)
(pred_2 obj_09 obj_07)
(pred_4 obj_09 obj_04)
(pred_4 obj_09 obj_01)
(pred_3 obj_11 obj_02)
(pred_3 obj_08 obj_07)
)
(:goal
(and
(pred_3 obj_11 obj_02)
(pred_3 obj_08 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_05 obj_06) (pred_2 obj_09 obj_06))))
  )
)
)